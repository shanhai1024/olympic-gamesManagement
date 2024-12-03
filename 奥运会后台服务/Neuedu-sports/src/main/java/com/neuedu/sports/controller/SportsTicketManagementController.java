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
import com.neuedu.sports.domain.SportsTicketManagement;
import com.neuedu.sports.service.ISportsTicketManagementService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 门票与观众服务-门票管理Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/ticketsAndAudience/ticketManagement")
@Tag(name = "【门票与观众服务-门票管理】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsTicketManagementController extends BaseController
{
    private final ISportsTicketManagementService sportsTicketManagementService;

    /**
     * 查询门票与观众服务-门票管理列表
     */
    @Operation(summary = "查询门票与观众服务-门票管理列表")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:ticketManagement:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsTicketManagement sportsTicketManagement)
    {
        startPage();
        List<SportsTicketManagement> list = sportsTicketManagementService.selectSportsTicketManagementList(sportsTicketManagement);
        return getDataTable(list);
    }

    /**
     * 导出门票与观众服务-门票管理列表
     */
    @Operation(summary = "导出门票与观众服务-门票管理列表")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:ticketManagement:export')")
    @Log(title = "门票与观众服务-门票管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsTicketManagement sportsTicketManagement)
    {
        List<SportsTicketManagement> list = sportsTicketManagementService.selectSportsTicketManagementList(sportsTicketManagement);
        ExcelUtil<SportsTicketManagement> util = new ExcelUtil<SportsTicketManagement>(SportsTicketManagement.class);
        util.exportExcel(response, list, "门票与观众服务-门票管理数据");
    }

    /**
     * 获取门票与观众服务-门票管理详细信息
     */
    @Operation(summary = "获取门票与观众服务-门票管理详细信息")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:ticketManagement:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsTicketManagementService.selectSportsTicketManagementById(id));
    }

    /**
     * 新增门票与观众服务-门票管理
     */
    @Operation(summary = "新增门票与观众服务-门票管理")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:ticketManagement:add')")
    @Log(title = "门票与观众服务-门票管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsTicketManagement sportsTicketManagement)
    {
        return toAjax(sportsTicketManagementService.insertSportsTicketManagement(sportsTicketManagement));
    }

    /**
     * 修改门票与观众服务-门票管理
     */
    @Operation(summary = "修改门票与观众服务-门票管理")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:ticketManagement:edit')")
    @Log(title = "门票与观众服务-门票管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsTicketManagement sportsTicketManagement)
    {
        return toAjax(sportsTicketManagementService.updateSportsTicketManagement(sportsTicketManagement));
    }

    /**
     * 删除门票与观众服务-门票管理
     */
    @Operation(summary = "删除门票与观众服务-门票管理")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:ticketManagement:remove')")
    @Log(title = "门票与观众服务-门票管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsTicketManagementService.deleteSportsTicketManagementByIds(ids));
    }
}
