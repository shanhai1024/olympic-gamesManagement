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
 * 新闻公告对象 sports_news
 * 
 * @author neuedu
 * @date 2024-06-13
 */
@Schema(description = "新闻公告对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_news")
public class SportsNews extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** 编号 */
    @Schema(title = "编号")
    private Long id;

    /** 新闻标题 */
    @Schema(title = "新闻标题")
    @Excel(name = "新闻标题")
    private String title;

    /** 新闻内容 */
    @Schema(title = "新闻内容")
    @Excel(name = "新闻内容")
    private String content;

    /** 浏览量 */
    @Schema(title = "浏览量")
    @Excel(name = "浏览量")
    private Long views;

    /** 附件路径 */
    @Schema(title = "附件路径")
    @Excel(name = "附件路径")
    private String file;
}
