JsOsaDAS1.001.00bplist00�Vscript_�var base = "https://www.youtube.com/feeds/videos.xml?channel_id="
var baseUser = "https://www.youtube.com/feeds/videos.xml?user="
var safari = Application('Safari')

var url = safari.windows[0].currentTab.url()

if (url.includes("user")) {
var res = url.split("/")
var id = res[4]
safari.windows[0].currentTab.url = baseUser + id
} else {
var res = url.split("/")
var id = res[res.length - 1]
safari.windows[0].currentTab.url = base + id
}

                              � jscr  ��ޭ