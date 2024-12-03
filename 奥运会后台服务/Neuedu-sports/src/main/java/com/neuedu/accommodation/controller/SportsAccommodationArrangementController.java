package com.neuedu.accommodation.controller;

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
import com.neuedu.accommodation.domain.SportsAccommodationArrangement;
import com.neuedu.accommodation.service.ISportsAccommodationArrangementService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 住宿安排Controller
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
@RestController
@RequestMapping("/accommodation/arrangement")
@Tag(name = "【住宿安排】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAccommodationArrangementController extends BaseController
{
    private final ISportsAccommodationArrangementService sportsAccommodationArrangementService;

    /**
     * 查询住宿安排列表
     */
    @Operation(summary = "查询住宿安排列表")
    @PreAuthorize("@ss.hasPermi('accommodation:arrangement:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsAccommodationArrangement sportsAccommodationArrangement)
    {
        startPage();
        List<SportsAccommodationArrangement> list = sportsAccommodationArrangementService.selectSportsAccommodationArrangementList(sportsAccommodationArrangement);
        return getDataTable(list);
    }

    /**
     * 导出住宿安排列表
     */
    @Operation(summary = "导出住宿安排列表")
    @PreAuthorize("@ss.hasPermi('accommodation:arrangement:export')")
    @Log(title = "住宿安排", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsAccommodationArrangement sportsAccommodationArrangement)
    {
        List<SportsAccommodationArrangement> list = sportsAccommodationArrangementService.selectSportsAccommodationArrangementList(sportsAccommodationArrangement);
        ExcelUtil<SportsAccommodationArrangement> util = new ExcelUtil<SportsAccommodationArrangement>(SportsAccommodationArrangement.class);
        util.exportExcel(response, list, "住宿安排数据");
    }

    /**
     * 获取住宿安排详细信息
     */
    @Operation(summary = "获取住宿安排详细信息")
    @PreAuthorize("@ss.hasPermi('accommodation:arrangement:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsAccommodationArrangementService.selectSportsAccommodationArrangementById(id));
    }

    /**
     * 新增住宿安排
     */
    @Operation(summary = "新增住宿安排")
    @PreAuthorize("@ss.hasPermi('accommodation:arrangement:add')")
    @Log(title = "住宿安排", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsAccommodationArrangement sportsAccommodationArrangement)
    {
        return toAjax(sportsAccommodationArrangementService.insertSportsAccommodationArrangement(sportsAccommodationArrangement));
    }

    /**
     * 修改住宿安排
     */
    @Operation(summary = "修改住宿安排")
    @PreAuthorize("@ss.hasPermi('accommodation:arrangement:edit')")
    @Log(title = "住宿安排", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsAccommodationArrangement sportsAccommodationArrangement)
    {
        return toAjax(sportsAccommodationArrangementService.updateSportsAccommodationArrangement(sportsAccommodationArrangement));
    }

    /**
     * 删除住宿安排
     */
    @Operation(summary = "删除住宿安排")
    @PreAuthorize("@ss.hasPermi('accommodation:arrangement:remove')")
    @Log(title = "住宿安排", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsAccommodationArrangementService.deleteSportsAccommodationArrangementByIds(ids));
    }
}
