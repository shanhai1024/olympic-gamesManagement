package com.neuedu.health.domain;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.neuedu.common.annotation.Excel;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.neuedu.common.core.domain.BaseEntity;

import io.swagger.v3.oas.annotations.media.Schema;

/**
 * 健康监测对象 sports_health_monitoring
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
@Schema(description = "健康监测对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_health_monitoring")
public class SportsHealthMonitoring extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** 编号 */
    @Schema(title = "编号")
    @Excel(name = "编号")
    private Long id;

    /** 人员类型（运动员/工作人员） */
    @Schema(title = "人员类型（运动员/工作人员）")
    @Excel(name = "人员类型", readConverterExp = "运=动员/工作人员")
    private String personType;

    /** 健康监测详情 */
    @Schema(title = "健康监测详情")
    @Excel(name = "健康监测详情")
    private String monitoringDetails;

    /** 医疗支持信息 */
    @Schema(title = "医疗支持信息")
    @Excel(name = "医疗支持信息")
    private String medicalSupportInfo;
}
