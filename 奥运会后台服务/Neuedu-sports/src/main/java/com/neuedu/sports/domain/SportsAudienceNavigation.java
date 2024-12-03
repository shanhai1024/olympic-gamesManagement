package com.neuedu.sports.domain;

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
 * 住宿与交通调度-观众导航对象 sports_audience_navigation
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "住宿与交通调度-观众导航对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_audience_navigation")
public class SportsAudienceNavigation extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 住宿信息 */
    @Schema(title = "住宿信息")
    @Excel(name = "住宿信息")
    private String accommodationInfo;

    /** 交通信息 */
    @Schema(title = "交通信息")
    @Excel(name = "交通信息")
    private String transportationInfo;

    /** 观众指南 */
    @Schema(title = "观众指南")
    @Excel(name = "观众指南")
    private String audienceGuide;
}
