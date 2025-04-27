/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.ProfileHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import javax.servlet.http.Part;

@MultipartConfig
public class EditProfileServlet extends HttpServlet {

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {

        String name = request.getParameter("user_name");
        String gender = request.getParameter("gender");
        String about = request.getParameter("about");
        Part part = request.getPart("profile");
        String profileImageName = part.getSubmittedFileName();

        // Generate a GUID for the profile image
        String guid = UUID.randomUUID().toString();

        // Get the file extension from the original profileImageName
        String fileExtension = profileImageName.substring(profileImageName.lastIndexOf('.'));

        // Create the new filename using the GUID and the file extension
        String newFileName = guid + fileExtension;

        // Construct the new image path
        String newImagePath = request.getRealPath("/") + "profiles" + File.separator + newFileName;

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("currentuser");

        user.setName(name);
        user.setGender(gender);
        user.setAbout(about);

        String oldProfileImageName = user.getProfile();
        String oldImagePath = request.getRealPath("/") + "profiles" + File.separator + oldProfileImageName;

        if (profileImageName.trim().isEmpty()) {
            user.setProfile(oldProfileImageName);
        } else {
            user.setProfile(newFileName); // Set the new filename (GUID)
        }

        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        if (dao.updateUser(user)) {
            session.setAttribute("currentuser", user);
            if (!profileImageName.trim().isEmpty()) {
                if (ProfileHelper.saveProfile(part.getInputStream(), newImagePath)) {
                    if (!oldProfileImageName.equals("default.png")) {
                        ProfileHelper.deleteProfile(oldImagePath);
                    }
                    Message msg = new Message("Profile Updated Successfully", "alert", "alert alert-success");
                    session.setAttribute("msg", msg);
                    response.sendRedirect("index.jsp");
                }
            } else {
                Message msg = new Message("Profile Updated Successfully", "alert", "alert alert-success");
                session.setAttribute("msg", msg);
                response.sendRedirect("index.jsp");
            }
        } else {
            Message msg = new Message("Something went wrong please try again..", "alert", "alert alert-danger");
            session.setAttribute("msg", msg);
            response.sendRedirect("index.jsp");
        }
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
