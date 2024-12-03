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
 * 运动员管理-现追踪对象 sports_athlete_performance_tracking
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "运动员管理-现追踪对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_athlete_performance_tracking")
public class SportsAthletePerformanceTracking extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 运动员ID */
    @Schema(title = "运动员ID")
    @Excel(name = "运动员ID")
    private Long athleteId;

    /** 训练表现 */
    @Schema(title = "训练表现")
    @Excel(name = "训练表现")
    private String trainingPerformance;

    /** 比赛表现 */
    @Schema(title = "比赛表现")
    @Excel(name = "比赛表现")
    private String competitionPerformance;
}
