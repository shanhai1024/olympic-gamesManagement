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
import com.neuedu.sports.domain.SportsBrandCooperation;
import com.neuedu.sports.service.ISportsBrandCooperationService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 媒体与公关-品牌合作Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/mediaAndPublic/brandCooperation")
@Tag(name = "【媒体与公关-品牌合作】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsBrandCooperationController extends BaseController
{
    private final ISportsBrandCooperationService sportsBrandCooperationService;

    /**
     * 查询媒体与公关-品牌合作列表
     */
    @Operation(summary = "查询媒体与公关-品牌合作列表")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:brandCooperation:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsBrandCooperation sportsBrandCooperation)
    {
        startPage();
        List<SportsBrandCooperation> list = sportsBrandCooperationService.selectSportsBrandCooperationList(sportsBrandCooperation);
        return getDataTable(list);
    }

    /**
     * 导出媒体与公关-品牌合作列表
     */
    @Operation(summary = "导出媒体与公关-品牌合作列表")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:brandCooperation:export')")
    @Log(title = "媒体与公关-品牌合作", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsBrandCooperation sportsBrandCooperation)
    {
        List<SportsBrandCooperation> list = sportsBrandCooperationService.selectSportsBrandCooperationList(sportsBrandCooperation);
        ExcelUtil<SportsBrandCooperation> util = new ExcelUtil<SportsBrandCooperation>(SportsBrandCooperation.class);
        util.exportExcel(response, list, "媒体与公关-品牌合作数据");
    }

    /**
     * 获取媒体与公关-品牌合作详细信息
     */
    @Operation(summary = "获取媒体与公关-品牌合作详细信息")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:brandCooperation:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsBrandCooperationService.selectSportsBrandCooperationById(id));
    }

    /**
     * 新增媒体与公关-品牌合作
     */
    @Operation(summary = "新增媒体与公关-品牌合作")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:brandCooperation:add')")
    @Log(title = "媒体与公关-品牌合作", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsBrandCooperation sportsBrandCooperation)
    {
        return toAjax(sportsBrandCooperationService.insertSportsBrandCooperation(sportsBrandCooperation));
    }

    /**
     * 修改媒体与公关-品牌合作
     */
    @Operation(summary = "修改媒体与公关-品牌合作")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:brandCooperation:edit')")
    @Log(title = "媒体与公关-品牌合作", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsBrandCooperation sportsBrandCooperation)
    {
        return toAjax(sportsBrandCooperationService.updateSportsBrandCooperation(sportsBrandCooperation));
    }

    /**
     * 删除媒体与公关-品牌合作
     */
    @Operation(summary = "删除媒体与公关-品牌合作")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:brandCooperation:remove')")
    @Log(title = "媒体与公关-品牌合作", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsBrandCooperationService.deleteSportsBrandCooperationByIds(ids));
    }
}
