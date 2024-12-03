package com.neuedu.audience.domain;

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
 * 观众指南对象 sports_audience_guide
 *
 * @author ruoyi
 * @date 2024-11-12
 */
@Schema(description = "观众指南对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_audience_guide")
public class SportsAudienceGuide extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** 编号 */
    @Schema(title = "编号")
    @Excel(name = "编号")
    private Long id;

    /** 赛事ID */
    @Schema(title = "赛事ID")
    @Excel(name = "赛事ID")
    private Long eventId;



    /** 场馆地图 */
    @Schema(title = "场馆地图")
    @Excel(name = "场馆地图")
    private String venueMap;

    /** 交通指南 */
    @Schema(title = "交通指南")
    @Excel(name = "交通指南")
    private String transportationGuide;

    /** 安全须知 */
    @Schema(title = "安全须知")
    @Excel(name = "安全须知")
    private String safetyNotice;
}
