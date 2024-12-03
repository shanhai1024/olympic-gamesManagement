package com.neuedu.sports.domain;

import java.time.LocalDate;
import com.fasterxml.jackson.annotation.JsonFormat;
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
 * 赛事管理-规则更新对象 sports_rule_update
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "赛事管理-规则更新对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_rule_update")
public class SportsRuleUpdate extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 规则内容 */
    @Schema(title = "规则内容")
    @Excel(name = "规则内容")
    private String ruleContent;

    /** 规则生效日期 */
    @Schema(title = "规则生效日期")
    @Excel(name = "规则生效日期")
    private LocalDate ruleEffectDate;
}
