
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class ProfileHelper {
    
    public static boolean deleteProfile(String path){
        
        boolean isSccess = false;
        
        try{
            File file = new File(path);
            isSccess = file.delete();
        }catch(Exception e){
            e.printStackTrace();
        }
        return isSccess;
    }
    
    
    public static boolean saveProfile(InputStream is,String path){
      
        boolean isSccess = false;
        
        try{
            
            byte[] b = new byte[is.available()];
            is.read(b);
            
            FileOutputStream fo = new FileOutputStream(path);
            
            fo.write(b);
            fo.flush();
            fo.close();
            isSccess = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return isSccess;
    }
    
    
    
}
