Shader "Custom/Water"
{
    Properties
    {
        
        _CubeMap("CubeMap", cube) = "" {}
        _BumpMap ("Water Bump", 2D) = "Bump" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        
        #pragma surface surf Lambert
        #pragma target 3.0

        samplerCUBE _CubeMap;
        sampler2D _BumpMap;

        struct Input
        {
            float2 uv_BumpMap;
            float3 worldRefl;
            INTERNAL_DATA
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Normal=UnpackNormal(tex2D(_BumpMap,IN.uv_BumpMap));
            o.Albedo = texCUBE(_CubeMap, WorldReflectionVector(IN, o.Normal));
        }
        ENDCG
    }
    FallBack "Diffuse"
}
