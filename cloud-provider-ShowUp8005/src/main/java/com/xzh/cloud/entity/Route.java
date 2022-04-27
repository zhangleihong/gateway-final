package com.xzh.cloud.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author 青哥哥
 * @since 2022-01-26
 */
@Getter
@Setter
@TableName("sys_route")
@ApiModel(value = "Route对象", description = "")
@ToString
public class Route implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("路由地址")
    private String uri;

    @ApiModelProperty("断言")
    private String predicates;

    @ApiModelProperty("过滤器")
    private String filters;

    @ApiModelProperty("优先级")
    private String ordered;

    @ApiModelProperty("描述")
    private String description;



}
