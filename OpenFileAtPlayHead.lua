-- Made by: VilleOlof
-- https://github.com/VilleOlof

projman = resolve:GetProjectManager()
proj = projman:GetCurrentProject()
timeline = proj:GetCurrentTimeline()
if not timeline then return end

item = timeline:GetCurrentVideoItem()
if not item then return end
mediapool_item = item:GetMediaPoolItem()
media_properties = mediapool_item:GetClipProperty()

file_path = media_properties["File Path"]

--Only supports windows with explorer /selected
local platform = (FuPLATFORM_WINDOWS and "Windows") or (FuPLATFORM_MAC and "Mac") or (FuPLATFORM_LINUX and "Linux")
if platform == "Windows" then 
    io.popen([[explorer /select,"]]..file_path..[["]])    
else
    print("Platform Not Available")
end