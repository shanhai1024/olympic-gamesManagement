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
 * 媒体与公关-品牌合作对象 sports_brand_cooperation
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "媒体与公关-品牌合作对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_brand_cooperation")
public class SportsBrandCooperation extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 赞助商名称 */
    @Schema(title = "赞助商名称")
    @Excel(name = "赞助商名称")
    private String sponsorName;

    /** 合作详情 */
    @Schema(title = "合作详情")
    @Excel(name = "合作详情")
    private String cooperationDetails;

    /** 开始日期 */
    @Schema(title = "开始日期")
    @Excel(name = "开始日期")
    private LocalDate startDate;

    /** 结束日期 */
    @Schema(title = "结束日期")
    @Excel(name = "结束日期")
    private LocalDate endDate;
}
