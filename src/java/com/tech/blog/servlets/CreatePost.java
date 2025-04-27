/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.ProfileHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "CreatePost", urlPatterns = {"/createpost"})
public class CreatePost extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            String title = request.getParameter("title");
            Part part = request.getPart("image");
            String content = request.getParameter("content");
            String code = request.getParameter("code");
            String categoryId = request.getParameter("category");

            if (categoryId == null) {
                out.print("select category");
            } else if (title == null || title.isEmpty()) {
                out.print("Enter title");
            } else if (part == null || part.getSubmittedFileName().isEmpty()) {
                out.print("select image");
            } else if (content == null || content.isEmpty()) {
                out.print("select content");

            } else {
                String imageName = part.getSubmittedFileName();
                int catId = Integer.parseInt(request.getParameter("category"));
                HttpSession session = request.getSession();

                User user = (User) session.getAttribute("currentuser");
                PostDao dao = new PostDao(ConnectionProvider.getConnection());

                // Generate a GUID for the image
                String guid = UUID.randomUUID().toString();

                // Get the file extension from the original imageName
                String fileExtension = imageName.substring(imageName.lastIndexOf('.'));

                // Create the new filename using the GUID and the original file extension
                String newFileName = guid + fileExtension;

                // Construct the new image path
                String newImagePath = request.getRealPath("/") + "posts" + File.separator + newFileName;

                if (dao.createPost(user.getId(), title, content, code, newFileName, catId)) {
                    if (ProfileHelper.saveProfile(part.getInputStream(), newImagePath)) {
                        out.print("success");
                    } else {
                        out.print("Some technical issues");
                    }
                }

            }

//            out.println(title);
//            out.println(content);
//            out.println(code);
//            out.println(categoryId);
//            out.println(imageName);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
