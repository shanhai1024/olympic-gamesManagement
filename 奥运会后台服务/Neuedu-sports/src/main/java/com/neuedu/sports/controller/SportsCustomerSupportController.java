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
import com.neuedu.sports.domain.SportsCustomerSupport;
import com.neuedu.sports.service.ISportsCustomerSupportService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 门票与观众服务-客服支持Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/ticketsAndAudience/customerSupport")
@Tag(name = "【门票与观众服务-客服支持】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsCustomerSupportController extends BaseController
{
    private final ISportsCustomerSupportService sportsCustomerSupportService;

    /**
     * 查询门票与观众服务-客服支持列表
     */
    @Operation(summary = "查询门票与观众服务-客服支持列表")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:customerSupport:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsCustomerSupport sportsCustomerSupport)
    {
        startPage();
        List<SportsCustomerSupport> list = sportsCustomerSupportService.selectSportsCustomerSupportList(sportsCustomerSupport);
        return getDataTable(list);
    }

    /**
     * 导出门票与观众服务-客服支持列表
     */
    @Operation(summary = "导出门票与观众服务-客服支持列表")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:customerSupport:export')")
    @Log(title = "门票与观众服务-客服支持", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsCustomerSupport sportsCustomerSupport)
    {
        List<SportsCustomerSupport> list = sportsCustomerSupportService.selectSportsCustomerSupportList(sportsCustomerSupport);
        ExcelUtil<SportsCustomerSupport> util = new ExcelUtil<SportsCustomerSupport>(SportsCustomerSupport.class);
        util.exportExcel(response, list, "门票与观众服务-客服支持数据");
    }

    /**
     * 获取门票与观众服务-客服支持详细信息
     */
    @Operation(summary = "获取门票与观众服务-客服支持详细信息")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:customerSupport:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsCustomerSupportService.selectSportsCustomerSupportById(id));
    }

    /**
     * 新增门票与观众服务-客服支持
     */
    @Operation(summary = "新增门票与观众服务-客服支持")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:customerSupport:add')")
    @Log(title = "门票与观众服务-客服支持", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsCustomerSupport sportsCustomerSupport)
    {
        return toAjax(sportsCustomerSupportService.insertSportsCustomerSupport(sportsCustomerSupport));
    }

    /**
     * 修改门票与观众服务-客服支持
     */
    @Operation(summary = "修改门票与观众服务-客服支持")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:customerSupport:edit')")
    @Log(title = "门票与观众服务-客服支持", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsCustomerSupport sportsCustomerSupport)
    {
        return toAjax(sportsCustomerSupportService.updateSportsCustomerSupport(sportsCustomerSupport));
    }

    /**
     * 删除门票与观众服务-客服支持
     */
    @Operation(summary = "删除门票与观众服务-客服支持")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:customerSupport:remove')")
    @Log(title = "门票与观众服务-客服支持", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsCustomerSupportService.deleteSportsCustomerSupportByIds(ids));
    }
}
