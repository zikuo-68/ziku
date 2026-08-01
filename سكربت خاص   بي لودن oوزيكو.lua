--[[
  ===========================================
  🛠️ تم التطوير بواسطة: زيكو نيمار 👑
  📢 المعرف الخاص بي: zuik1@
  📌 handle: @pla_ten
  📅 مشروع تطوير اللعبة: ZikoBall ⚽
  ===========================================
]]

-- Data Types
local TYPE_DWORD = gg.TYPE_DWORD
local TYPE_FLOAT = gg.TYPE_FLOAT
local TYPE_QWORD = gg.TYPE_QWORD
local TYPE_BYTE = gg.TYPE_BYTE

-- الجداول والمتغيرات العالمية
local originalValues = {}
local originals = {}
local status = {}
local lang = "ar"
local onIcon = "🟢 "
local offIcon = "🔴 "

-- ################# ################# ################# --
-- ### قسم التحقق وحقوق المطور زيكو نيمار ###
-- ################# ################# ################# --

function checkExpiry()
    local currentTime = os.time()
    local expiryDate = os.time({year=2026, month=8, day=10, hour=0, min=0, sec=0})
    if currentTime >= expiryDate then
        gg.alert("تم انتهاء وقت الاشتراك، تواصل مع المطور زيكو نيمار")
        while true do gg.sleep(1000) end -- منع الخروج حتى عند انتهاء الوقت
    end
end

-- ################# ################# ################# --
-- ### قسم استعادة القيم الأصلية والتحميل ###
-- ################# ################# ################# --

function revertAllValues()
    gg.setVisible(false)
    if #originalValues == 0 and next(originals) == nil then
        gg.alert("❌ لا توجد قيم مخزنة لاستعادتها حالياً.")
        return
    end
    
    gg.toast("⏳ جاري استعادة جميع القيم الأصلية...")
    
    if #originalValues > 0 then
        gg.setValues(originalValues)
        originalValues = {}
    end
    
    for k, v in pairs(originals) do
        if type(v) == "table" then
            for _, item in ipairs(v) do item.freeze = false end
            gg.setValues(v)
            gg.addListItems(v)
        end
    end
    originals = {}
    
    if _G.kondisyonResults ~= nil then
        for _, v in ipairs(_G.kondisyonResults) do v.freeze = false end
        gg.setValues(_G.kondisyonResults)
        _G.kondisyonResults = nil
    end
    
    for k, _ in pairs(status) do status[k] = false end
    gg.toast("✅ تم استعادة كل شيء بنجاح!")
end

function showProgressBar()
    local progress_bars = {
        "▓▒▒▒▒▒▒▒▒▒ 10% جاري التحميل", "▓▓▒▒▒▒▒▒▒▒ 20% جاري التحميل", "▓▓▓▒▒▒▒▒▒▒ 30% جاري التحميل",
        "▓▓▓▓▒▒▒▒▒▒ 40% جاري التحميل", "▓▓▓▓▓▒▒▒▒▒ 50% جاري التحميل", "▓▓▓▓▓▓▒▒▒▒ 60% جاري التحميل",
        "▓▓▓▓▓▓▓▒▒▒ 70% جاري التحميل", "▓▓▓▓▓▓▓▓▒▒ 80% جاري التحميل", "▓▓▓▓▓▓▓▓▓▒ 90% جاري التحميل",
        "▓▓▓▓▓▓▓▓▓▓ 100% جاري التحميل"
    }
    for _, bar in ipairs(progress_bars) do gg.toast(bar); gg.sleep(150) end
    gg.toast("✅ السكريبت جاهز للاستخدام")
end

-- ################# ################# ################# --
-- ### الكود المضاف حديثاً: تقوية جميع اللاعبين (أونلاين + أوفلاين) ###
-- ################# ################# ################# --

function TOGGLE_TEAM_BOOST()
    local opts = lang == "ar" and {"⚡ تفعيل التقوية والتجميد", "🔄 إعادة ضبط القيم الأصلية", "🔙 رجوع"} or {"⚡ Activate Boost & Freeze", "🔄 Reset Original Values", "🔙 Back"}
    local menu = gg.choice(opts, nil, "🔥 تقوية جميع اللاعبين (أونلاين + أوفلاين)")
    if menu == nil or menu == 3 then return end
    
    if menu == 1 then
        gg.setVisible(false)
        gg.toast(lang == "ar" and "⏳ جاري البحث وتقوية اللاعبين..." or "⏳ Searching & Boosting Players...")
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        
        gg.searchNumber("90439680;90439680", gg.TYPE_DWORD)
        local results = gg.getResults(100)
        
        if #results == 0 then
            gg.alert(lang == "ar" and "❌ لم يتم العثور على القيم! تأكد من أنك داخل المباراة." or "❌ Values Not Found! Make sure you are in a match.")
            return
        end
        
        gg.clearResults()
        gg.searchNumber("-1", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, results[1].address, results[#results].address)
        local editRes = gg.getResults(100)
        
        if #editRes > 0 then
            originals.boost_edit = {}
            for i, v in ipairs(editRes) do
                originals.boost_edit[i] = {address = v.address, flags = v.flags, value = v.value}
                v.value = 3131316262626231
                v.freeze = true
            end
            gg.setValues(editRes)
            gg.addListItems(editRes)
            gg.clearResults()
            
            gg.searchNumber("1836008230", gg.TYPE_DWORD)
            gg.refineNumber("-1", gg.TYPE_DWORD)
            local refineRes = gg.getResults(100)
            
            if #refineRes > 0 then
                originals.boost_refine = {}
                for i, v in ipairs(refineRes) do
                    originals.boost_refine[i] = {address = v.address, flags = v.flags, value = v.value}
                    v.value = -1
                    v.freeze = true
                end
                gg.setValues(refineRes)
                gg.addListItems(refineRes)
                gg.clearResults()
            end
            
            status.team_boost = true
            gg.toast(lang == "ar" and "✅ تم تفعيل تقوية وتجميد طاقات اللاعبين!" or "✅ Team Boost Activated & Frozen!")
        else
            gg.alert(lang == "ar" and "❌ فشل استخراج قيم التعديل الثانية." or "❌ Failed to refine secondary values.")
        end
        
    elseif menu == 2 then
        local restored = false
        if originals.boost_edit ~= nil then
            for _, v in ipairs(originals.boost_edit) do v.freeze = false end
            gg.setValues(originals.boost_edit)
            originals.boost_edit = nil
            restored = true
        end
        if originals.boost_refine ~= nil then
            for _, v in ipairs(originals.boost_refine) do v.freeze = false end
            gg.setValues(originals.boost_refine)
            originals.boost_refine = nil
            restored = true
        end
        
        if restored then
            status.team_boost = false
            gg.toast(lang == "ar" and "🔄 تم إلغاء التقوية وإعادة طاقات اللاعبين لأصلها" or "🔄 Boost reset to normal")
        else
            gg.toast(lang == "ar" and "❌ لا توجد قيم تقوية نشطة حالياً" or "❌ No active boost to reset")
        end
    end
end

-- ################# ################# ################# --
-- ### أقسام الدوال الستة الأونلاين التلقائية المعاد ارجاعها كاملة ###
-- ################# ################# ################# --

function antiBan()
    gg.setRanges(gg.REGION_C_HEAP)
    gg.searchNumber("0", gg.TYPE_DWORD)
    local ab = gg.getResults(20)
    for i, v in ipairs(ab) do
        v.value = 9999999
        v.freeze = true
    end
    gg.addListItems(ab)
    gg.toast("✅ حماية الباند مفعلة 🔐")
end

function powerShot()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1.5;2.0;3.0::13", gg.TYPE_FLOAT)
    local r = gg.getResults(50)
    for i, v in ipairs(r) do v.value = 7.7 end
    gg.setValues(r)
    gg.clearResults()
    gg.toast(" ✅ تم تفعيل زيادة تمركز اللعيبة ")
end

function fullPossession()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("0.6;0.7;0.8::13", gg.TYPE_FLOAT)
    local r = gg.getResults(50)
    for i, v in ipairs(r) do v.value = 9.9 end
    gg.setValues(r)
    gg.clearResults()
    gg.toast(" تم تفعيل زيادة دقة البينية  ✅")
end

function boostGK()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1;5;7;9::13", gg.TYPE_DWORD)
    gg.refineNumber("7", gg.TYPE_DWORD)
    local gk = gg.getResults(50)
    for i, v in ipairs(gk) do v.value = 35 end
    gg.setValues(gk)
    gg.clearResults()
    gg.toast("🧤 تم تقوية الحارس!")
end

function speedMatch()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1;1.0;1.2::13", gg.TYPE_FLOAT)
    local r = gg.getResults(50)
    for i, v in ipairs(r) do v.value = 2.5 end
    gg.setValues(r)
    gg.clearResults()
    gg.toast("⚡ قيد التطوير ❌")
end

-- ################# ################# ################# --
-- ### أقسام الحظ المحدث وتفعيل السيرفر ###
-- ################# ################# ################# --

function epicbox()
    gg.setVisible(false)
    gg.toast("👑 زيكو نيمار 👑")
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("h00 01 00 b4 89 45 01 d0 29 d1 46 f9 e8 03 00 aa e0 03 1f 2a 29 55 40 b9 09 01 00 b9 c0 03 5f d6 00 00 80 12 c0 03 5f d6 00 04 00 b4 f4 0f 1e f8 f3 7b 01 a9 94 45 01 d0 94 d2 46 f9 f3 03 00 aa 1f 00 14 eb 60 02 00 54", gg.TYPE_BYTE, true, gg.SIGN_EQUAL, 0, -1, 0)
    gg.processResume(); gg.getResults(8); gg.editAll("h00 00 80 92 c0 03 5f d6", gg.TYPE_BYTE); gg.clearResults()
    gg.searchNumber("hf6 57 bd a9 f4 4f 01 a9 fd 7b 02 a9 fd 83 00 91 f4 03 01 aa e8 1b 09 32 f3 03 00 aa 88 02 00 b9 68 ba 40 f9 f5 03 02 2a e8 00 00 b4 08 09 40 b9 e9 7b 00 32 1f 01 09 6b a1 00 00 54 e0 03 1f 2a 0e 00 00 14 e0 03 1f 2a", gg.TYPE_BYTE, true, gg.SIGN_EQUAL, 0, -1, 0)
    gg.processResume(); gg.getResults(8); gg.editAll("h00 00 80 92 c0 03 5f d6", gg.TYPE_BYTE); gg.clearResults()
    gg.setRanges(gg.REGION_C_DATA); gg.searchNumber("89133724764840", gg.TYPE_QWORD); gg.getResults(100); gg.editAll("89133724764840", gg.TYPE_QWORD); gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("h0a 98 42 f9 8b 5d 89 52 4b 00 a0 72 89 47 89 52 5f 69 2b 78 8b 48 89 52 49 00 a0 72 ec 1f 00 32 4b 00 a0 72 4c 69 29 f8 4c 69 2b f8 8b 49 89 52 4b 00 a0 72 4c 69 2b f8 8b 4a 89 52 4b 00 a0 72 4c 69 2b f8 8b 4b 89 52", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    gg.processResume(); gg.getResults(8); gg.editAll("h00 00 80 92 c0 03 5f d6", gg.TYPE_BYTE); gg.clearResults()
    gg.alert("تم تقويه نسبه الحظ ✅")
end

function skillgames()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("453737769", gg.TYPE_DWORD); gg.getResults(50000); gg.editAll("1384120329", gg.TYPE_DWORD); gg.clearResults()
    gg.toast("تم تفعيل زياده نسبه الحظ")
end

function luckEnhancer()
    showProgressBar()
    epicbox()
    gg.sleep(500)
    skillgames()
    
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_C_DATA)
    
    gg.searchNumber("88033139494357:17", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
    gg.searchNumber("1065353216;720;486;30000;1001:17", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    gg.refineNumber("1065353216", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    
    local savedLuck = gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
    if #savedLuck > 0 then
        for i, v in ipairs(savedLuck) do 
            table.insert(originalValues, {address=v.address, value=v.value, flags=v.flags}) 
        end
        gg.editAll("1066999999", gg.TYPE_DWORD)
        gg.toast("🍀✅ تم تفعيل الحظ v2 بنجاح!")
    else
        gg.toast("⚠️ لم يتم العثور على قيم الحظ v2 بالذاكرة")
    end
    gg.clearResults()
end

-- ################# ################# ################# --
-- ### أقسام التحويلات الكاملة الخاصة باللاعبين المعاد ارجاعها ###
-- ################# ################# ################# --

function convertParisMainSquad()
    gg.setVisible(false)
    local modeChoice = gg.choice({
        "🎮 مباراة استعراضية (Anymous + Data C++)",
        "🏟️ تشكيلة أساسية (Anymous + Other)",
        "🔙 إلغاء"
    }, nil, "⚙️ اختر نوع التشكيلة المراد تحويلها لباريس:")
    if modeChoice == nil or modeChoice == 3 then return end
    
    gg.toast("⏳ جاري تحويل اللاعبين من بيزك الى ابك بوستر...")
    if modeChoice == 1 then
        gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_DATA)
    elseif modeChoice == 2 then
        gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_OTHER)
    end
    
    local function convert(search, edit)
        gg.clearResults()
        gg.searchNumber(search, gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.processResume()
        local count = gg.getResultCount()
        if count > 0 then
            local results = gg.getResults(99999)
            for _, v in ipairs(results) do
                table.insert(originalValues, {address=v.address, value=v.value, flags=v.flags})
            end
            gg.editAll(edit, gg.TYPE_QWORD)
        end
        gg.processResume()
    end

    convert("128720", "89138019825360")
    convert("152928", "106746580456800")
    convert("108239", "106759196889835")
    convert("110626", "106782013894690")
    convert("159320", "106759465365080")
    convert("135067", "106778524258203")
    convert("113960", "106776645188904")
    convert("132756", "106748459484820")
    convert("45993", "88040387118614")
    gg.toast("🔥 تم اكتمال تحويل اللاعبين بنجاح!")
end

function transformRealMadrid()
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_DATA)
    gg.toast("⏳ جاري تحويل نجوم ريال مدريد بالكامل...")

    local realMadridData = {
        {"44383", "106738795720031"}, {"104677", "106738258909413"}, {"41124", "88039045074370"},
        {"113405", "106733963950845"}, {"113911", "106758928448759"}
    }

    local activatedCount = 0
    for _, player in ipairs(realMadridData) do
        gg.searchNumber(player[1], TYPE_QWORD)
        if gg.getResultCount() > 0 then
            local results = gg.getResults(gg.getResultCount())
            for _, v in ipairs(results) do table.insert(originalValues, {address=v.address, value=v.value, flags=v.flags}) end
            gg.editAll(player[2], TYPE_QWORD)
            activatedCount = activatedCount + 1
        end
        gg.clearResults()
    end
    gg.toast("⚪ Real Madrid Active!\nتم تحويل " .. activatedCount .. " لاعب")
end

function transformRareRealMadrid()
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_DATA)
    gg.toast("⏳ جاري تحويل لاعبين نوادر ريال مدريد...")

    local rareData = {
        {"175491", "17592186179023"}, {"177862", "17592186048938"}, {"158533", "17592723049936"},
        {"144440", "17592186051927"}, {"132216", "17592186179005"}, {"158740", "17592186182370"},
        {"142410", "17592186179010"}, {"164926", "17592186160297"}, {"118038", "17592186179052"},
        {"119889", "17592186179001"}, {"168561", "17592991351636"}, {"154889", "17592186179051"},
        {"117793", "17592186179054"}, {"101355", "17592186048489"}, {"134931", "17592186084768"},
        {"47070", "17592186179053"}, {"114105", "17592991485383"}, {"60512", "17592723049946"},
        {"42669", "17592186182373"}, {"118136", "17592186045914"}, {"133677", "17592186179030"},
        {"118096", "17592186179020"}, {"122333", "17592186179036"}
    }

    local activatedCount = 0
    for _, player in ipairs(rareData) do
        gg.searchNumber(player[1], TYPE_QWORD)
        if gg.getResultCount() > 0 then
            local results = gg.getResults(gg.getResultCount())
            for _, v in ipairs(results) do table.insert(originalValues, {address=v.address, value=v.value, flags=v.flags}) end
            gg.editAll(player[2], TYPE_QWORD)
            activatedCount = activatedCount + 1
        end
        gg.clearResults()
    end
    gg.toast("💎 Real Madrid Rares Active!\nتم تفعيل " .. activatedCount .. " لاعب نادر")
end

function transformArsenal()
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_DATA)
    gg.toast("⏳ جاري تحويل تشكيلة أرسنال بالكامل...")

    local arsenalData = {
        {"126918", "88036092284395"}, {"119700", "88035555413482"}, {"114506", "88039044974657"},
        {"133299", "88036360723170"}, {"108959", "106752486016837"}, {"130202", "88038776505140"},
        {"140051", "88036360719886"}, {"111207", "88035823852263"}, {"126689", "88036360701097"},
        {"132155", "88032334054874"}, {"101520", "88035823848941"}, {"47242", "88039044943928"},
        {"156838", "88036092152543"}, {"148009", "88038776505238"}, {"114044", "88033407929794"},
        {"133678", "88033139494376"}, {"120439", "88036360723173"}, {"103613", "88036360723168"},
        {"103404", "88033139494333"}, {"114906", "88033407929824"}, {"127544", "88036092284395"},
        {"102109", "17603728769159"}
    }

    local activatedCount = 0
    for _, player in ipairs(arsenalData) do
        gg.searchNumber(player[1], TYPE_QWORD)
        if gg.getResultCount() > 0 then
            local results = gg.getResults(gg.getResultCount())
            for _, v in ipairs(results) do table.insert(originalValues, {address=v.address, value=v.value, flags=v.flags}) end
            gg.editAll(player[2], TYPE_QWORD)
            activatedCount = activatedCount + 1
        end
        gg.clearResults()
    end
    gg.toast("🔴 Gunners Active!\nتم تحويل " .. activatedCount .. " لاعب من أرسنال")
end

function transformBigTime()
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_DATA)
    gg.toast("⏳ جاري تحويل حزمة لاعبين بيك تايم...")

    local bigTimeData = {
        {"110718", "8913456301399"}, {"132933", "89130772048333"}, {"117047", "89130772069289"},
        {"141578", "89067421306306"}, {"128078", "89135066951464"}, {"119782", "89129966765504"},
        {"113911", "105568953959383"}, {"113525", "106727789932670"}, {"159586", "89132919465292"},
        {"154986", "89135066911146"}, {"44383", "89135066963747"}, {"123124", "89135067044780"},
        {"171620", "89135067068738"}, {"57353", "89135067035344"}, {"113405", "89065005387197"},
        {"107889", "89132651102396"}, {"127571", "89135067017250"}, {"104710", "89066884435465"},
        {"114566", "89131308929393"}, {"118977", "89133724764840"}, {"167997", "89133993205152"},
        {"155208", "89134261635137"}, {"157472", "89136140651034"}, {"104677", "17592186179036"}
    }

    local activatedCount = 0
    for _, player in ipairs(bigTimeData) do
        gg.searchNumber(player[1], TYPE_QWORD)
        if gg.getResultCount() > 0 then
            local results = gg.getResults(gg.getResultCount())
            for _, v in ipairs(results) do table.insert(originalValues, {address=v.address, value=v.value, flags=v.flags}) end
            gg.editAll(player[2], TYPE_QWORD)
            activatedCount = activatedCount + 1
        end
        gg.clearResults()
    end
    gg.toast("⚡ Big Time Active!\nتم تحويل " .. activatedCount .. " لاعب بنجاح")
end

function transformUCL2025()
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_DATA)
    gg.toast("⏳ جاري تحويل حزمة دوري الأبطال 2025...")

    local uclData = {
        {"110718", "52868094734462"}, {"132933", "5280442771767"}, {"117047", "52893596124997"},
        {"141578", "5289327660012"}, {"128078", "52853867659142"}, {"119782", "52884737730975"},
        {"113911", "52885274625684"}, {"113525", "52884737754772"}, {"159586", "52869705368672"},
        {"154986", "52868094737849"}, {"44383", "52853867590569"}, {"123124", "52885274311"},
        {"171620", "52885006219586"}, {"57353", "52878832158735"}, {"113405", "52885006165751"},
        {"107889", "52847156719848"}, {"127571", "52884200884647"}, {"104710", "52869705269665"},
        {"114506", "52850377998456"}, {"118977", "52853867588955"}, {"167997", "52893059165992"},
        {"155208", "52849304260801"}, {"157472", "52885274603566"}
    }

    local activatedCount = 0
    for _, player in ipairs(uclData) do
        gg.searchNumber(player[1], TYPE_QWORD)
        if gg.getResultCount() > 0 then
            local results = gg.getResults(gg.getResultCount())
            for _, v in ipairs(results) do table.insert(originalValues, {address=v.address, value=v.value, flags=v.flags}) end
            gg.editAll(player[2], TYPE_QWORD)
            activatedCount = activatedCount + 1
        end
        gg.clearResults()
    end
    gg.toast("🏆 UCL 2025 Active!\nتم تحويل " .. activatedCount .. " لاعب بنجاح")
end

function searchAndEditCustom(searchNum, searchType, editVal, label, memoryRange)
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(memoryRange)
    gg.toast("⏳ جاري البحث عن " .. label .. "...")
    gg.searchNumber(searchNum, searchType)
    local count = gg.getResultCount()
    if count > 0 then
        local results = gg.getResults(count)
        for i, v in ipairs(results) do table.insert(originalValues, {address=v.address, value=v.value, flags=v.flags}) end
        gg.editAll(tostring(editVal), searchType)
        gg.toast("✅ تم تفعيل " .. label .. "\nتم تعديل " .. count .. " قيمة")
    else
        gg.alert("❌ لم يتم العثور على: " .. label)
    end
    gg.clearResults()
end

-- ################# ################# ################# --
-- ### تفعيلات الأونلاين التلقائية وسكربت وطن المدمج بقيمها الأصلية ###
-- ################# ################# ################# --

function TOGGLE_PLAYER_STAMINA()
    if status.stamina == true then
        if _G.kondisyonResults ~= nil then
            for _, v in ipairs(_G.kondisyonResults) do v.freeze = false end
            gg.setValues(_G.kondisyonResults)
            _G.kondisyonResults = nil
        end
        status.stamina = false
        gg.alert("تم إيقاف لياقة اللاعبين ✅")
    else
        gg.clearResults()
        gg.setVisible(false)
        gg.searchNumber("90439680", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, gg.REGION_ANONYMOUS)
        local results = gg.getResults(99999)
        if #results > 0 then
            for i, v in ipairs(results) do
                v.value = (i <= 40) and 73662464 or 6553880
                v.freeze = true
            end
            gg.toast("جاري التحميل: 100% | ○○○●")
            gg.sleep(50)
            gg.setValues(results)
            gg.addListItems(results)
            _G.kondisyonResults = results
            status.stamina = true
            gg.toast("\n🔴 لياقة اللاعبين مفعّلة 🔵")
            gg.clearResults()
        else
            gg.alert("❌ لم يتم العثور على القيم! يرجى إعادة تشغيل اللعبة ❌")
            status.stamina = false
        end
    end
end

function TOGGLE_AUTOWIN()
    gg.alert("لا تستخدم بكثرة - التفعيل مستمر ولا يتوقف")
    gg.clearResults()
    gg.searchNumber("90439680;90439680", gg.TYPE_DWORD)
    local results = gg.getResults(3054)
    
    if #results == 0 then
        gg.alert("🔔 لم يتم العثور على القيم! أعد تشغيل اللعبة 🔔")
        return
    end
    
    gg.clearResults()
    gg.toast("جار التحميل: 15% | ●○○")
    gg.searchNumber("0", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, results[1].address, results[#results].address)
    local editResults = gg.getResults(3054)
    
    if #editResults > 0 then
        for i, v in ipairs(editResults) do
            if i > 3054 then break end
            v.value = "9409557315021733888"
            v.freeze = true
        end
        gg.setValues(editResults)
        gg.clearResults()
        
        gg.toast("جار التحميل: 70% | ○●○")
        gg.searchNumber("1836008230;25::", gg.TYPE_DWORD)
        gg.refineNumber("0", gg.TYPE_DWORD)
        local refineResults = gg.getResults(99999)
        
        if #refineResults > 0 then
            for _, v in ipairs(refineResults) do
                v.value = -1
                v.freeze = true
            end
            gg.setValues(refineResults)
            gg.clearResults()
            status.autowin = true
            gg.toast("✅ SUCCESS!")
        else
            gg.alert("🔔 VALUE NOT FOUND 🔔")
        end
        
        while true do
            gg.toast("\n👑 ZIKO NEYMAR: AUTO WIN ACTIVE 👑")
            for _, v in ipairs(editResults) do v.value = "9409557315021733888" end
            gg.setValues(editResults)
            for _, v in ipairs(editResults) do v.value = 0 end
            gg.setValues(editResults)
            for _, v in ipairs(editResults) do v.value = -1 end
            gg.setValues(editResults)
            gg.sleep(20000) 
        end
    else
        gg.alert("🔔 NO VALUES FOUND 🔔")
    end
end

function playerConditionHack()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.toast("⏳ جاري تفعيل أسهم اللاعبين...")
    gg.searchNumber("90439680", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    
    local results = gg.getResults(99999)
    if results and #results > 0 then
        for i, v in ipairs(results) do
            if v.flags == gg.TYPE_DWORD then
                table.insert(originalValues, {address=v.address, value=v.value, flags=v.flags})
                v.value = 73662464
                v.freeze = true
            end
        end
        gg.addListItems(results)
        gg.toast("✅ تم تفعيل أسهم اللاعبين (حالة A) بنجاح!")
        gg.clearResults()
    else
        gg.toast("❌ لا توجد نتائج! تأكد من أنك داخل المباراة.")
    end
end

-- ################# ################# ################# --
-- ### قـسـم تـفـعـيـلات الأوفـلايـن المضافة والـطـاقـات  ###
-- ################# ################# ################# --

function TOGGLE_FREEZE_GK()
    local opts = lang == "ar" and {"🥅 تفعيل الخاصية", "🔄 إعادة ضبط القيم", "🔙 رجوع"} or {"🥅 Activate", "🔄 Reset Values", "🔙 Back"}
    local menu = gg.choice(opts, nil, "❄️ تجميد حارس المرمى")
    if menu == nil or menu == 3 then return end
    
    if menu == 1 then
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber("33554443;0;0::9", gg.TYPE_DWORD)
        local results = gg.getResults(10)
        if #results > 0 then
            originals.gk = {}
            for i, v in ipairs(results) do
                originals.gk[i] = {address = v.address, flags = v.flags, value = v.value}
                if v.value == 1 then v.value = 0 v.freeze = true end
            end
            gg.setValues(results)
            gg.addListItems(results) 
            status.gk = true
            gg.toast("✅ تم تجميد الحارس الخصم")
        end
    elseif menu == 2 then
        if originals.gk ~= nil then
            for _, v in ipairs(originals.gk) do v.freeze = false end
            gg.setValues(originals.gk)
            originals.gk = nil
            status.gk = false
            gg.toast("🔄 تم إعادة ضبط الحارس")
        end
    end
end

function TOGGLE_FAST_SHOOT()
    local opts = lang == "ar" and {"⚡️ تفعيل الخاصية", "🔄 إعادة ضبط القيم", "🔙 رجوع"} or {"⚡️ Activate", "🔄 Reset Values", "🔙 Back"}
    local menu = gg.choice(opts, nil, "🚀 تسديد سريع")
    if menu == nil or menu == 3 then return end
    
    if menu == 1 then
        gg.setRanges(gg.REGION_C_DATA)
        gg.clearResults()
        gg.searchNumber("1065352511;1065352897", gg.TYPE_DWORD)
        local Gatsby = gg.getResults(500)
        if #Gatsby > 0 then
            originals.fast = {}
            for i, v in ipairs(Gatsby) do
                originals.fast[i] = {address = v.address, flags = v.flags, value = v.value}
                v.freeze = true
            end
            gg.editAll("1084229999", gg.TYPE_DWORD)
            local frozenList = gg.getResults(500)
            for _, item in ipairs(frozenList) do item.freeze = true end
            gg.addListItems(frozenList) 
            status.fast = true
            gg.toast("🚀 تم تفعيل وتجميد التسديد السريع")
        end
    elseif menu == 2 then
        if originals.fast ~= nil then
            for _, v in ipairs(originals.fast) do v.freeze = false end
            gg.setValues(originals.fast)
            originals.fast = nil
            status.fast = false
        end
    end
end

function TOGGLE_PENALTY_KICK()
    local opts = lang == "ar" and {"🧤 تفعيل الخاصية", "🔄 إعادة ضبط القيم", "🔙 رجوع"} or {"🧤 Activate", "🔄 Reset Values", "🔙 Back"}
    local menu = gg.choice(opts, nil, "🥅 ركلات ترجيح")
    if menu == nil or menu == 3 then return end
    
    if menu == 1 then
        gg.setRanges(gg.REGION_C_DATA)
        gg.clearResults()
        gg.searchNumber("1065352511;1065352897", gg.TYPE_DWORD)
        local results = gg.getResults(500)
        if #results > 0 then
            originals.penalty = {}
            for i, v in ipairs(results) do
                originals.penalty[i] = {address = v.address, flags = v.flags, value = v.value}
                v.freeze = true
            end
            gg.editAll("1084229999", gg.TYPE_DWORD)
            local frozenList = gg.getResults(500)
            for _, item in ipairs(frozenList) do item.freeze = true end
            gg.addListItems(frozenList) 
            status.penalty = true
            gg.toast("🥅 تم تفعيل ميزة ركلات الترجيح")
        end
    elseif menu == 2 then
        if originals.penalty ~= nil then
            for _, v in ipairs(originals.penalty) do v.freeze = false end
            gg.setValues(originals.penalty)
            originals.penalty = nil
            status.penalty = false
        end
    end
end

function TOGGLE_DELETE_PLAYERS()
    local opts = lang == "ar" and {"👤 تفعيل الخاصية", "🔄 إعادة ضبط القيم", "🔙 رجوع"} or {"👤 Activate", "🔄 Reset Values", "🔙 Back"}
    local menu = gg.choice(opts, nil, "👤 حذف لاعبين الخصم")
    if menu == nil or menu == 3 then return end
    
    if menu == 1 then
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber("90439680Q;90439680Q:201", gg.TYPE_QWORD)
        local results = gg.getResults(80)
        if #results >= 57 then
            originals.delete_players = {}
            local editList = {}
            for i = 1, #results do originals.delete_players[i] = {address = results[i].address, flags = results[i].flags, value = results[i].value} end
            for i = 40, 57 do table.insert(editList, {address = results[i].address, flags = results[i].flags, value = 99999999, freeze = true}) end
            gg.setValues(editList)
            gg.addListItems(editList) 
            status.delete_players = true
            gg.toast("✅ تم حذف الخصم وتجميد مراكزهم")
        else
            gg.alert("❌ لم يتم العثور على قيم كافية بالمباراة")
        end
    elseif menu == 2 then
        if originals.delete_players ~= nil then
            for _, v in ipairs(originals.delete_players) do v.freeze = false end
            gg.setValues(originals.delete_players)
            originals.delete_players = nil
            status.delete_players = false
            gg.toast("🔄 تم إلغاء حذف اللاعبين")
        end
    end
end

-- ################# ################# ################# --
-- ### القوائم والتحكم والربط الهيكلي للسكربت ###
-- ################# ################# ################# --

function onlineMenu()
    local menu = gg.choice({
        "🛡️ حماية الحساب (Anti-Ban)",
        "🏃‍♂️ تفعيل زيادة تمركز اللاعبين",
        "🎯 زيادة دقة التمريرات البينية",
        "🧤 جدار برلين - تقوية الحارس",
        "⚡ تسريع المباراة (قيد التطوير)",
        "🟢 تفعيل لياقة اللاعبين المستمرة",
        "🔥 فوز تلقائي (أونلاين مستمر)",
        "📈 أسهم اللاعبين (حالة A)",
        "⚡ تقوية جميع اللاعبين (أونلاين + أوفلاين) 🔥",
        "🔙 العودة للقائمة الرئيسية"
    }, nil, "🌐 قائمة تفعيلات الأونلاين - زيكو نيمار")

    if menu == nil then return end
    
    if menu == 1 then antiBan() end
    if menu == 2 then powerShot() end
    if menu == 3 then fullPossession() end
    if menu == 4 then boostGK() end
    if menu == 5 then speedMatch() end
    if menu == 6 then TOGGLE_PLAYER_STAMINA() end
    if menu == 7 then TOGGLE_AUTOWIN() end
    if menu == 8 then playerConditionHack() end
    if menu == 9 then TOGGLE_TEAM_BOOST() end
    if menu == 10 then return end
end

function teamTransformMenu()
    local menu = gg.choice({
        "🗼 تحويل تشكيلة باريس سان جيرمان",
        "⚪ تحويل نجوم ريال مدريد",
        "💎 تحويل نوادر ريال مدريد",
        "🔴 تحويل تشكيلة أرسنال بالكامل",
        "⚡ تحويل حزمة لاعبين بيك تايم",
        "🏆 تحويل حزمة دوري الأبطال 2025",
        "🔙 العودة للقائمة الرئيسية"
    }, nil, "👕 قسم تحويل الفرق واللاعبين")

    if menu == nil then return end
    
    if menu == 1 then convertParisMainSquad() end
    if menu == 2 then transformRealMadrid() end
    if menu == 3 then transformRareRealMadrid() end
    if menu == 4 then transformArsenal() end
    if menu == 5 then transformBigTime() end
    if menu == 6 then transformUCL2025() end
    if menu == 7 then return end
end

function offlineAndRatingsMenu()
    local choice = gg.choice({
        "❄️ تجميد حارس المرمى (أوفلاين)",
        "🚀 تفعيل التسديد السريع",
        "🥅 ركلات الترجيح المضمونة",
        "👤 حذف لاعبين الخصم وتجميدهم",
        "⚡ تقوية جميع اللاعبين (أونلاين + أوفلاين) 🔥",
        "📈 تقييم عالي (لاعبين)", 
        "👔 ريت مدرب اموريم (127)", 
        "🔙 العودة للقائمة الرئيسية"
    }, nil, "🛠️ قسم تفعيلات الأوفلاين والطاقات")

    if choice == nil or choice == 8 then return end
    
    if choice == 1 then TOGGLE_FREEZE_GK() end
    if choice == 2 then TOGGLE_FAST_SHOOT() end
    if choice == 3 then TOGGLE_PENALTY_KICK() end
    if choice == 4 then TOGGLE_DELETE_PLAYERS() end
    if choice == 5 then TOGGLE_TEAM_BOOST() end
    if choice == 6 then 
        searchAndEditCustom("1;1;2;2;3;3;4;4;5;5;6;6;7;7;8;8;9;9;10;10;11;11;12;12;13;13;14;15;18;16;17;17;21;19;22;20;20;21;27;22;28;23;23;24;15;25;24;26;37;28:197", TYPE_DWORD, "114", "تقييم اللاعبين", gg.REGION_C_DATA)
    end
    if choice == 7 then 
        searchAndEditCustom("40;62;81;54;89;46", TYPE_DWORD, "127", "ريت اموريم", gg.REGION_OTHER | gg.REGION_ANONYMOUS)
    end
end

function mainMenu()
    while true do
        if gg.isVisible() then
            local menu = gg.choice({
                "🌐 قائمة تفعيلات الأونلاين [محدثة]",
                "👕 قسم تحويل الفرق واللاعبين",
                "📴 قسم تفعيلات الأوفلاين والطاقات",
                "🍀 تفعيل سيرفر ونسبة الحظ v2",
                "🔄 استعادة جميع القيم الأصلية",
                "⛔ منع الخروج (مخفي بالخلفية)"
            }, nil, "👑 سكربت زيكو نيمار المطور 👑")

            if menu == nil or menu == 6 then 
                gg.setVisible(false)
                gg.toast("👑 السكربت يعمل بالخلفية.. اضغط أيقونة GG لفتحه 👑")
            elseif menu == 1 then onlineMenu()
            elseif menu == 2 then teamTransformMenu()
            elseif menu == 3 then offlineAndRatingsMenu()
            elseif menu == 4 then luckEnhancer()
            elseif menu == 5 then revertAllValues()
            end
        end
        gg.sleep(100)
    end
end

-- تشغيل السكربت بالتسلسل الصحيح
checkExpiry()
mainMenu()
