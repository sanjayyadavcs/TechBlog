package com.tech.blog.helper;

public class StringHelper {

    public static int getIndexofFullStop(String str,int length) {
        int firstDot = str.indexOf(". ");
        if (firstDot < length) {
            int secondDot = str.indexOf(". ", firstDot + 1);
            return secondDot+1;
        } else {
            return firstDot+1;
        }
    }

}
