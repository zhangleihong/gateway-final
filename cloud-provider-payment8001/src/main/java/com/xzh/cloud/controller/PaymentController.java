package com.xzh.cloud.controller;

import com.xzh.cloud.entities.CommonResult;
import com.xzh.cloud.entities.Ips;
import com.xzh.cloud.entities.Payment;
import com.xzh.cloud.service.IpService;
import com.xzh.cloud.service.PaymentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@RestController
@Slf4j
public class PaymentController {
    @Resource
    private PaymentService paymentService;
    @Resource
    private IpService ipService;

    @Value("${server.port}")
    private String serverPort;

//    String ipAddress = IpUtil.getLocalIP();
//    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//    Ips ip = new Ips();
//        ip.setPort(request.getLocalPort());
//        ip.setRequestUrl(String.valueOf(request.getRequestURL()));
//        ip.setIp(ipAddress);
//        ip.setVisitTime(df.format(new Date()));
//        ipService.insertIp(ip);

    @PostMapping(value="/payment/create")
    public CommonResult create(@RequestBody Payment payment, HttpServletRequest request){
        int result = paymentService.create(payment);

        String ipAddress = IpUtil.getLocalIP();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Ips ip = new Ips();
        ip.setPort(request.getLocalPort());
        ip.setRequestUri(String.valueOf(request.getRequestURI()));
        ip.setIp(ipAddress);
        ip.setVisitTime(df.format(new Date()));
        ipService.insertIp(ip);

        if(result>0){
            return new CommonResult(200,"插入成功 serverPort" + serverPort, result);
        }
        else{
            return new CommonResult(404,"插入失败 serverPort" + serverPort, result);
        }
    }

    @GetMapping(value="/payment/get/{id}")
    public CommonResult getPaymentById(@PathVariable("id") Long id, HttpServletRequest request){
        Payment payment = paymentService.getPaymentById(id);

        String ipAddress = IpUtil.getLocalIP();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Ips ip = new Ips();
        ip.setPort(request.getLocalPort());
        ip.setRequestUri(String.valueOf(request.getRequestURI()));
        ip.setIp(ipAddress);
        ip.setVisitTime(df.format(new Date()));
        ipService.insertIp(ip);


        if(payment!=null){
            return new CommonResult(200,"查询成功 serverPort" + serverPort, payment);
        }
        else{
            return new CommonResult(404,"查询失败 serverPort" + serverPort, null);
        }
    }

    @GetMapping(value="/payment/timeout")
    public String timeout(){
        try{
            TimeUnit.SECONDS.sleep(3);
        }catch (InterruptedException e){
            e.printStackTrace();
        }
        return serverPort;
    }

    @GetMapping(value="/payment/lb")
    public String getPaymentLB(HttpServletRequest request){
        String ipAddress = IpUtil.getLocalIP();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Ips ip = new Ips();
        ip.setPort(request.getLocalPort());
        ip.setRequestUri(String.valueOf(request.getRequestURI()));
        ip.setIp(ipAddress);
        ip.setVisitTime(df.format(new Date()));
        ipService.insertIp(ip);
        return serverPort;
    }

}
