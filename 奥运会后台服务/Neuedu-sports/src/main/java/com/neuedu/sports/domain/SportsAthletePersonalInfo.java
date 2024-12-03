package com.neuedu.sports.domain;

import java.math.BigDecimal;
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
 * 运动员管理-个人信息管理对象 sports_athlete_personal_info
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "运动员管理-个人信息管理对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_athlete_personal_info")
public class SportsAthletePersonalInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 运动员姓名 */
    @Schema(title = "运动员姓名")
    @Excel(name = "运动员姓名")
    private String athleteName;

    /** 性别 */
    @Schema(title = "性别")
    @Excel(name = "性别")
    private String athleteGender;

    /** 年龄 */
    @Schema(title = "年龄")
    @Excel(name = "年龄")
    private Long athleteAge;

    /** 身高 */
    @Schema(title = "身高")
    @Excel(name = "身高")
    private BigDecimal athleteHeight;

    /** 体重 */
    @Schema(title = "体重")
    @Excel(name = "体重")
    private BigDecimal athleteWeight;

    /** 国籍 */
    @Schema(title = "国籍")
    @Excel(name = "国籍")
    private String athleteNationality;

    /** 成绩历史 */
    @Schema(title = "成绩历史")
    @Excel(name = "成绩历史")
    private String performanceHistory;

    /** 健康状况 */
    @Schema(title = "健康状况")
    @Excel(name = "健康状况")
    private String healthStatus;
}
