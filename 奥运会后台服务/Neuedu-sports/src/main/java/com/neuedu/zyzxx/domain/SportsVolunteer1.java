package com.neuedu.zyzxx.domain;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import com.neuedu.common.annotation.Excel;
import com.baomidou.mybatisplus.annotation.*;
import lombok.EqualsAndHashCode;
import com.neuedu.common.core.domain.BaseEntity;

/**
 * 志愿者信息中心对象 sports_volunteer
 *
 * @author ruoyi
 * @date 2024-11-12
 */
@Schema(description = "志愿者信息中心对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_volunteer")
public class SportsVolunteer1 extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** 编号 */
    @Schema(title = "编号")
    private Long id;

    /** 信息简介 */
    @Schema(title = "信息简介")
    @Excel(name = "信息简介")
    private String title;

    /** 信息详情 */
    @Schema(title = "信息详情")
    @Excel(name = "信息详情")
    private String content;

    /** 浏览量 */
    @Schema(title = "浏览量")
    @Excel(name = "浏览量")
    private Long views;
}
