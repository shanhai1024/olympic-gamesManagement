package com.neuedu.sports.domain;

import java.math.BigDecimal;
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
 * 门票与观众服务-门票管理对象 sports_ticket_management
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "门票与观众服务-门票管理对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_ticket_management")
public class SportsTicketManagement extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 赛事ID */
    @Schema(title = "赛事ID")
    @Excel(name = "赛事ID")
    private Long eventId;

    /** 票价 */
    @Schema(title = "票价")
    @Excel(name = "票价")
    private BigDecimal ticketPrice;

    /** 票量 */
    @Schema(title = "票量")
    @Excel(name = "票量")
    private Long ticketQuantity;
}
