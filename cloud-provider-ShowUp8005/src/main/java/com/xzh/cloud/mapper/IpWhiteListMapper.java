package com.xzh.cloud.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xzh.cloud.entity.IpWhiteList;
import com.xzh.cloud.entity.Ips;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IpWhiteListMapper extends BaseMapper<IpWhiteList> {
    void changeFlag(int id);

    int selectFlag(int id);

    List<IpWhiteList> selectByIp(String ip);
}
