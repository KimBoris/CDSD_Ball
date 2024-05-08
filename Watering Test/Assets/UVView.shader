Shader "Custom/UVView"
{
    Properties
    {
        
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200
        
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float4 maintex = tex2D(_MainTex, IN.uv_MainTex);
            o.Emission =float3(IN.uv_MainTex.x, IN.uv_MainTex.y, 0);
        }
            

        ENDCG
    }
    FallBack "Diffuse"
}
