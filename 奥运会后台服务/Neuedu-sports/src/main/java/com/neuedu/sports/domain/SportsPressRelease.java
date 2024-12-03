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
 * 媒体与公关-新闻发布对象 sports_press_release
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "媒体与公关-新闻发布对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_press_release")
public class SportsPressRelease extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 新闻标题 */
    @Schema(title = "新闻标题")
    @Excel(name = "新闻标题")
    private String newsTitle;

    /** 新闻内容 */
    @Schema(title = "新闻内容")
    @Excel(name = "新闻内容")
    private String newsContent;

    /** 发布日期 */
    @Schema(title = "发布日期")
    @Excel(name = "发布日期")
    private LocalDate publishDate;
}
