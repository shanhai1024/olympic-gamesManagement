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
import com.neuedu.sports.domain.SportsPressRelease;
import com.neuedu.sports.service.ISportsPressReleaseService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 媒体与公关-新闻发布Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/mediaAndPublic/pressRelease")
@Tag(name = "【媒体与公关-新闻发布】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsPressReleaseController extends BaseController
{
    private final ISportsPressReleaseService sportsPressReleaseService;

    /**
     * 查询媒体与公关-新闻发布列表
     */
    @Operation(summary = "查询媒体与公关-新闻发布列表")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:pressRelease:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsPressRelease sportsPressRelease)
    {
        startPage();
        List<SportsPressRelease> list = sportsPressReleaseService.selectSportsPressReleaseList(sportsPressRelease);
        return getDataTable(list);
    }

    /**
     * 导出媒体与公关-新闻发布列表
     */
    @Operation(summary = "导出媒体与公关-新闻发布列表")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:pressRelease:export')")
    @Log(title = "媒体与公关-新闻发布", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsPressRelease sportsPressRelease)
    {
        List<SportsPressRelease> list = sportsPressReleaseService.selectSportsPressReleaseList(sportsPressRelease);
        ExcelUtil<SportsPressRelease> util = new ExcelUtil<SportsPressRelease>(SportsPressRelease.class);
        util.exportExcel(response, list, "媒体与公关-新闻发布数据");
    }

    /**
     * 获取媒体与公关-新闻发布详细信息
     */
    @Operation(summary = "获取媒体与公关-新闻发布详细信息")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:pressRelease:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsPressReleaseService.selectSportsPressReleaseById(id));
    }

    /**
     * 新增媒体与公关-新闻发布
     */
    @Operation(summary = "新增媒体与公关-新闻发布")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:pressRelease:add')")
    @Log(title = "媒体与公关-新闻发布", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsPressRelease sportsPressRelease)
    {
        return toAjax(sportsPressReleaseService.insertSportsPressRelease(sportsPressRelease));
    }

    /**
     * 修改媒体与公关-新闻发布
     */
    @Operation(summary = "修改媒体与公关-新闻发布")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:pressRelease:edit')")
    @Log(title = "媒体与公关-新闻发布", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsPressRelease sportsPressRelease)
    {
        return toAjax(sportsPressReleaseService.updateSportsPressRelease(sportsPressRelease));
    }

    /**
     * 删除媒体与公关-新闻发布
     */
    @Operation(summary = "删除媒体与公关-新闻发布")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:pressRelease:remove')")
    @Log(title = "媒体与公关-新闻发布", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsPressReleaseService.deleteSportsPressReleaseByIds(ids));
    }
}
