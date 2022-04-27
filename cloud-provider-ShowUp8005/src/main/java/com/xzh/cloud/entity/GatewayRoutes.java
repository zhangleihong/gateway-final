package com.xzh.cloud.entity;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.xzh.cloud.controller.dto.GatewayFilterDefinition;
import com.xzh.cloud.controller.dto.GatewayPredicateDefinition;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;
@Getter
@Setter
@TableName("gateway_routes")
@ApiModel(value = "Route对象", description = "")
@ToString
public class GatewayRoutes {
    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private String routeId;

    private String routeUri;

    private Integer routeOrder;

    private String predicates;

    private String filters;

    private Boolean isEbl;

    private Boolean isDel;

    private Date createTime;

    private Date updateTime;



    /**
     * 获取断言集合
     *
     * @return
     */
    public List<GatewayPredicateDefinition> getPredicateDefinition() {
        if (!StringUtils.isEmpty(this.predicates)) {
            return JSON.parseArray(this.predicates, GatewayPredicateDefinition.class);
        }
        return null;
    }

    /**
     * 获取过滤器集合
     *
     * @return
     */
    public List<GatewayFilterDefinition> getFilterDefinition() {
        if (!StringUtils.isEmpty(this.filters)) {
            return JSON.parseArray(this.filters, GatewayFilterDefinition.class);
        }
        return null;
    }
}