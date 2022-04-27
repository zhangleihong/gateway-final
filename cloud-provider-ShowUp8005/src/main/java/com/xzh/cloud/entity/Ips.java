package com.xzh.cloud.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@TableName("sys_ip")
@AllArgsConstructor
@NoArgsConstructor
public class Ips {

    @TableId(type = IdType.AUTO)
    private Integer id;
    private String ip;
    @TableField(value = "visitTime" )
    private String visitTime;
    @TableField(value = "requestUri" )
    private String requestUri;
    private Integer port;
}