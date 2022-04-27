package com.xzh.cloud;

import io.xjar.XKit;
import io.xjar.boot.XBoot;
import io.xjar.key.XKey;

import java.security.NoSuchAlgorithmException;

public class mainGo {
    public static void main(String[] args) throws Exception {
        String password = "ccbc2016";
        XKey xKey = XKit.key(password);
        try {
            xKey = XKit.key(password);
            XBoot.encrypt("D:\\研究生项目\\主动防御\\cloud-provider-ShowUp8005-1.0-SNAPSHOT.jar", "D:\\研究生项目\\主动防御\\cloud-provider-ShowUp8005-1.0-locked.jar", xKey);
            System.out.println("成功了");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
