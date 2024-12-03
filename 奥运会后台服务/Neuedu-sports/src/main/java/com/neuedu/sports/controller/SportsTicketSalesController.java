package com.neuedu.sports.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.neuedu.common.annotation.Log;
import com.neuedu.common.core.controller.BaseController;
import com.neuedu.common.core.domain.AjaxResult;
import com.neuedu.common.enums.BusinessType;
import com.neuedu.sports.domain.SportsTicketSales;
import com.neuedu.sports.service.ISportsTicketSalesService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 门票与观众服务-门票销售Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/ticketsAndAudience/ticketSales")
@Tag(name = "【门票与观众服务-门票销售】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsTicketSalesController extends BaseController
{
    private final ISportsTicketSalesService sportsTicketSalesService;

    /**
     * 查询门票与观众服务-门票销售列表
     */
    @Operation(summary = "查询门票与观众服务-门票销售列表")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:ticketSales:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsTicketSales sportsTicketSales)
    {
        startPage();
        List<SportsTicketSales> list = sportsTicketSalesService.selectSportsTicketSalesList(sportsTicketSales);
        return getDataTable(list);
    }

    /**
     * 导出门票与观众服务-门票销售列表
     */
    @Operation(summary = "导出门票与观众服务-门票销售列表")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:ticketSales:export')")
    @Log(title = "门票与观众服务-门票销售", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsTicketSales sportsTicketSales)
    {
        List<SportsTicketSales> list = sportsTicketSalesService.selectSportsTicketSalesList(sportsTicketSales);
        ExcelUtil<SportsTicketSales> util = new ExcelUtil<SportsTicketSales>(SportsTicketSales.class);
        util.exportExcel(response, list, "门票与观众服务-门票销售数据");
    }

    /**
     * 获取门票与观众服务-门票销售详细信息
     */
    @Operation(summary = "获取门票与观众服务-门票销售详细信息")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:ticketSales:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsTicketSalesService.selectSportsTicketSalesById(id));
    }

    /**
     * 新增门票与观众服务-门票销售
     */
    @Operation(summary = "新增门票与观众服务-门票销售")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:ticketSales:add')")
    @Log(title = "门票与观众服务-门票销售", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsTicketSales sportsTicketSales)
    {
        return toAjax(sportsTicketSalesService.insertSportsTicketSales(sportsTicketSales));
    }

    /**
     * 修改门票与观众服务-门票销售
     */
    @Operation(summary = "修改门票与观众服务-门票销售")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:ticketSales:edit')")
    @Log(title = "门票与观众服务-门票销售", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsTicketSales sportsTicketSales)
    {
        return toAjax(sportsTicketSalesService.updateSportsTicketSales(sportsTicketSales));
    }

    /**
     * 删除门票与观众服务-门票销售
     */
    @Operation(summary = "删除门票与观众服务-门票销售")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:ticketSales:remove')")
    @Log(title = "门票与观众服务-门票销售", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsTicketSalesService.deleteSportsTicketSalesByIds(ids));
    }
}
