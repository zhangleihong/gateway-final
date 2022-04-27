package com.xzh.cloud.service;


import com.xzh.cloud.dao.PaymentDao;
import com.xzh.cloud.entities.Payment;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PaymentServiceImpl implements PaymentService{

    @Resource
    private PaymentDao paymentDao;

    public int create(Payment payment){
        return paymentDao.create(payment);
    }


    public Payment getPaymentById(@Param("id") Long id){

        return paymentDao.getPaymentById(id);
    }

}
