package com.xzh.cloud.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.cloud.entity.IpWhiteList;
import com.xzh.cloud.entity.Ips;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

public interface IpWhiteListService extends IService<IpWhiteList> {
    void changeFlag(int id);

    int selectFlag(int id);

    List<IpWhiteList> selectByIp(String ip);
}
