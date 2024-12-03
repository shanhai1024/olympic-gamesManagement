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
 * 赛事管理-结果记录对象 sports_result_record
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "赛事管理-结果记录对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_result_record")
public class SportsResultRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long jie;

    /** 比赛ID */
    @Schema(title = "比赛ID")
    @Excel(name = "比赛ID")
    private Long matchId;

    /** 获胜运动员ID */
    @Schema(title = "获胜运动员ID")
    @Excel(name = "获胜运动员ID")
    private Long winnerAthleteId;

    /** 失败运动员ID */
    @Schema(title = "失败运动员ID")
    @Excel(name = "失败运动员ID")
    private String loserAthleteId;

    /** 比赛结果 */
    @Schema(title = "比赛结果")
    @Excel(name = "比赛结果")
    private String result;
}
