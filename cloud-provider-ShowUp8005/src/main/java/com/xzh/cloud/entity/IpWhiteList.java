package com.xzh.cloud.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.*;

@Getter
@Setter
@Data
@TableName("ipwhitelist")
@AllArgsConstructor
@NoArgsConstructor
public class IpWhiteList {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String ip;

    @TableField(value = "flag")
    private int flag;



}
