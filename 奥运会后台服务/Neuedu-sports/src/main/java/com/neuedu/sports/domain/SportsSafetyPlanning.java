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
 * 安全与健康协议-安全规划对象 sports_safety_planning
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "安全与健康协议-安全规划对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_safety_planning")
public class SportsSafetyPlanning extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 突发事件安全预案 */
    @Schema(title = "突发事件安全预案")
    @Excel(name = "突发事件安全预案")
    private String emergencyPlan;

    /** 撤离计划 */
    @Schema(title = "撤离计划")
    @Excel(name = "撤离计划")
    private String evacuationPlan;
}
