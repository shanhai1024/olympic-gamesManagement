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
 * 运动员管理-参赛资格审核对象 sports_athlete_eligibility_review
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "运动员管理-参赛资格审核对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_athlete_eligibility_review")
public class SportsAthleteEligibilityReview extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 运动员ID */
    @Schema(title = "运动员ID")
    @Excel(name = "运动员ID")
    private Long athleteId;

    /** 资格标准 */
    @Schema(title = "资格标准")
    @Excel(name = "资格标准")
    private String eligibilityCriteria;

    /** 药检信息 */
    @Schema(title = "药检信息")
    @Excel(name = "药检信息")
    private String dopingTestInfo;

    /** 资格状态 */
    @Schema(title = "资格状态")
    @Excel(name = "资格状态")
    private String eligibilityStatus;
}
