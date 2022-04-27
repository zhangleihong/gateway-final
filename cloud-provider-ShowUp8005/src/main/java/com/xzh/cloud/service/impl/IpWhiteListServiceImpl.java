package com.xzh.cloud.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xzh.cloud.entity.IpWhiteList;
import com.xzh.cloud.entity.Ips;
import com.xzh.cloud.mapper.IpMapper;
import com.xzh.cloud.mapper.IpWhiteListMapper;
import com.xzh.cloud.service.IpService;
import com.xzh.cloud.service.IpWhiteListService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class IpWhiteListServiceImpl extends ServiceImpl<IpWhiteListMapper, IpWhiteList> implements IpWhiteListService {

    @Resource
    IpWhiteListMapper ipWhiteListMapper;

    @Override
    public void changeFlag(int id) {
        IpWhiteList ipWhiteList = ipWhiteListMapper.selectById(id);
        if(ipWhiteList.getFlag()==1){
            ipWhiteList.setFlag(0);
        }else{
            ipWhiteList.setFlag(1);
        }
        ipWhiteListMapper.updateById(ipWhiteList);
    }

    @Override
    public int selectFlag(int id) {
        System.out.println(111);
        System.out.println(ipWhiteListMapper.selectFlag(id));
        return  ipWhiteListMapper.selectFlag(id);
    }

    @Override
    public List<IpWhiteList> selectByIp(String ip) {
        return ipWhiteListMapper.selectByIp(ip);
    }


}
