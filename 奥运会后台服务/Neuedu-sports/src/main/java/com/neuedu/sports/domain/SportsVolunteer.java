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
 * 志愿者信息中心对象 sports_volunteer
 * 
 * @author neuedu
 * @date 2024-06-13
 */
@Schema(description = "志愿者信息中心对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_volunteer")
public class SportsVolunteer extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** 编号 */
    @Schema(title = "编号")
    private Long id;

    /** 标题 */
    @Schema(title = "标题")
    @Excel(name = "标题")
    private String title;

    /** 内容 */
    @Schema(title = "内容")
    @Excel(name = "内容")
    private String content;

    /** 浏览量 */
    @Schema(title = "浏览量")
    @Excel(name = "浏览量")
    private Long views;
}
