//package com.xzh.cloud.listener;
//
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.stereotype.Component;
//
//import javax.servlet.ServletContext;
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;
//import javax.servlet.annotation.WebListener;
//import java.util.concurrent.ConcurrentHashMap;
//
//@Slf4j
//@WebListener
//public class IpListener implements ServletContextListener {
//    @Override
//    public void contextInitialized(ServletContextEvent sce) {
//        log.debug("liting: contextInitialized");
//        log.debug("MyApplicationListener初始化成功");
//        ServletContext context = sce.getServletContext();
//        // IP存储器
//        ConcurrentHashMap<String, Long[]> ipMap = new ConcurrentHashMap<>();
//        context.setAttribute("ipMap", ipMap);
//        // 限制IP存储器：存储被限制的IP信息
//        ConcurrentHashMap<String, Long> limitedIpMap = new ConcurrentHashMap<String, Long>();
//        context.setAttribute("limitedIpMap", limitedIpMap);
//        log.debug("ipmap："+ipMap.toString()+";limitedIpMap:"+limitedIpMap.toString()+"初始化成功。。。。。");
//    }
//    @Override
//    public void contextDestroyed(ServletContextEvent sce) {
//        // TODO Auto-generated method stub
//    }
//}
