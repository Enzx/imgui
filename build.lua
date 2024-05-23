project "imgui"
	kind "StaticLib"
	language "C++"
	staticruntime "off"
	warnings "off"

	targetdir "%{wks.location}/build/bin/%{cfg.architecture}-%{cfg.buildcfg}/"
    objdir "%{wks.location}/build/obj/%{cfg.architecture}-%{cfg.buildcfg}/"
	
	links
	{
	"GLFW"
	}
	
	includedirs
	{
	"%{wks.location}/vendors/GLFW/include"
	
	}

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",

	}


	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		defines { "_ITERATOR_DEBUG_LEVEL=2", "DEBUG" }
		buildoptions { "/MDd" }
		
	filter { "system:windows"}	
		runtime "Debug"
		symbols "on"
		-- sanitize { "Address" }
		flags { "NoRuntimeChecks", "NoIncrementalLink" }
		

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"
		-- linkoptions {"/NODEFAULTLIB:MSVCRT"}
		defines { "_ITERATOR_DEBUG_LEVEL=0", "NDEBUG" }
		buildoptions { "/MD" } 
