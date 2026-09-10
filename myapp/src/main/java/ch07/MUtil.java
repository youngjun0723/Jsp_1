package ch07;

import jakarta.servlet.http.HttpServletRequest;

import java.util.Random;

public class MUtil {
    public static String randomColor(){
        Random r = new Random();
        String rgb = Integer.toHexString(r.nextInt(256));
        rgb += Integer.toHexString(r.nextInt(256));
        rgb += Integer.toHexString(r.nextInt(256));
        return "#" + rgb;
    }
    // 정수로 넘긴 값을 정수로 변환 기능
    public static int parseInt(HttpServletRequest request, String name){
        return  Integer.parseInt(request.getParameter(name));
    }
}
