package com.zhouyibetter.utils;

import java.time.LocalDateTime;
import java.util.Random;

/**
 * Uuid工具类
 * uuid的格式：(u|p) YYY:MM:DD:HH:MM:SS [0-9a-zA-Z]{18}
 */
public class UuidUtil {
    private static String Format(String t) {
        StringBuilder r = new StringBuilder();
        for (int i = 1; i < t.length() - 10; i++) {
            if (t.charAt(i) != '-' && t.charAt(i) != 'T' && t.charAt(i) != ':') {
                r.append(t.charAt(i));
            }
        }
        return r.toString();
    }

    private static String RandomR() {
        String allChars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random random = new Random();
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < 18; i++) {
            int index = random.nextInt(allChars.length());
            result.append(allChars.charAt(index));
        }
        return result.toString();
    }

    /**
     * Uuid生成
     *
     * @param uuidType
     * @return
     */
    public static String get(int uuidType) {
        String result = "";
        // 用户项目的uuid
        LocalDateTime now = LocalDateTime.now();
        String t = now.toString();
        t = Format(t);

        // 生成随机18长度字符
        String r = RandomR();
        if (uuidType == 0) {
            result = 'u' + t + r;
        } else if (uuidType == 1) {
            result = 't' + t + r;
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(get(0));
    }
}
