project "imgui_backends"
	kind "StaticLib"
	language "C++"
	staticruntime "off"
	warnings "off"

	targetdir "%{wks.location}/build/bin/%{cfg.architecture}-%{cfg.buildcfg}/"
    objdir "%{wks.location}/build/obj/%{cfg.architecture}-%{cfg.buildcfg}/"
	
	links
	{
	"GLFW",
	"imgui"
	}
	
	includedirs
	{
		"%{wks.location}/vendors/GLFW/include",
		"%{wks.location}/vendors/imgui/",
		"%{wks.location}/vendors/glad/include/"
	}

	files
	{
		"imgui_impl_glfw.h",
		"imgui_impl_glfw.cpp",
		"imgui_impl_opengl3.h",
		"imgui_impl_opengl3.cpp",

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
		
		
		
		
