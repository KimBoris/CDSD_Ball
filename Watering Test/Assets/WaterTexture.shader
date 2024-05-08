Shader "Custom/WaterTexture"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white"{}
        _MainTex2 ("Texture", 2D) = "white"{}
        _GS("Hoit", Range(0,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        //뭘 입힐 것인지
        sampler2D _MainTex;
        sampler2D _MainTex2;
        float _GS;

        //어디에 입혀야 하는지
        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;
        };


        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
           
           float4 MainTex = tex2D(_MainTex, IN.uv_MainTex);
           float MainTex2 = tex2D(_MainTex2, IN.uv_MainTex2);
           
           //o.Emission = lerp(MainTex, MainTex2, _GS);
           o.Emission = lerp(MainTex, MainTex2,MainTex.a*_GS);
           
           //rgb3가지 색상 사용
           //o.Emission = MainTex.rgb;
           
           //회색
           //o.Emission = (MainTex.r + MainTex.g + MainTex.b)/3;

        }
        ENDCG
    }
    FallBack "Diffuse"
}
