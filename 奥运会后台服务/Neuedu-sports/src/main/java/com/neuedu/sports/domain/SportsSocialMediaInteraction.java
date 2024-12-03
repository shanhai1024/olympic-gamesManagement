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
 * 媒体与公关-社交媒体互动对象 sports_social_media_interaction
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "媒体与公关-社交媒体互动对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_social_media_interaction")
public class SportsSocialMediaInteraction extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 社交媒体平台 */
    @Schema(title = "社交媒体平台")
    @Excel(name = "社交媒体平台")
    private String socialMediaPlatform;

    /** 帖子内容 */
    @Schema(title = "帖子内容")
    @Excel(name = "帖子内容")
    private String postContent;

    /** 发布日期 */
    @Schema(title = "发布日期")
    @Excel(name = "发布日期")
    private LocalDate postDate;

    /** 互动次数 */
    @Schema(title = "互动次数")
    @Excel(name = "互动次数")
    private Long engagementCount;
}
