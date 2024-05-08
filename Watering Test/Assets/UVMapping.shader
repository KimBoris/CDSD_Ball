Shader "Custom/UVMapping"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        //_U ("tiling U",float) = 1
        //_V ("tiling V", float) = 1
        _U ("offset U",float) = 1
        _V ("offset V", float) = 1
        _CT("Speed", float) = 0
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM

        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;
        float1 _U;
        float1 _V;
        float1 _CT;
        struct Input
        {
            float2 uv_MainTex;
        };

        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            //float4 maintex = tex2D(_MainTex,IN.uv_MainTex* float2(_U, _V));
            float4 maintex = tex2D(_MainTex, IN.uv_MainTex + float2(IN.uv_MainTex.x + _Time.y*_CT, IN.uv_MainTex.y));
            o.Emission = maintex.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
