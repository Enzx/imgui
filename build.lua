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
		"backends/imgui_impl_glfw.h",
		"backends/imgui_impl_glfw.cpp",
		"backends/imgui_impl_opengl3.h",
		"backends/imgui_impl_opengl3.cpp",
	}


	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter { "system:windows"}	
		runtime "Debug"
		symbols "on"
		-- sanitize { "Address" }
		flags { "NoRuntimeChecks", "NoIncrementalLink" }

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"
