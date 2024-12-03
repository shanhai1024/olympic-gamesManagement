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
 * 用户反馈对象 sports_feedback
 * 
 * @author neuedu
 * @date 2024-06-13
 */
@Schema(description = "用户反馈对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_feedback")
public class SportsFeedback extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** 编号 */
    @Schema(title = "编号")
    private Long id;

    @Schema(title = "用户id")
    private Long userId;

    /** 标题 */
    @Schema(title = "标题")
    @Excel(name = "标题")
    private String title;

    /** 状态 */
    @Schema(title = "状态")
    @Excel(name = "状态")
    private String status;

    /** 内容 */
    @Schema(title = "内容")
    @Excel(name = "内容")
    private String content;

    /** 联系人 */
    @Schema(title = "联系人")
    @Excel(name = "联系人")
    private String contacts;

    /** 联系电话 */
    @Schema(title = "联系电话")
    @Excel(name = "联系电话")
    private String contactPhone;
}
