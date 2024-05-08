Shader "Custom/Ball"
{
    Properties
    {
        _Depth("Depth", Range(0,1)) = 0.5
    }
    SubShader
    {
        Tags{"RenderType" = "Opaque"}
        LOD 100

        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_MainTex;
        };
        
        float _Depth;

        void surf(Input IN, inout SurfaceOutput o)
        {
            //수심에 따른 공의 크기 조절
            float3 pos = float3(IN.uv_MainTex, 0); //2D 좌표를 3D로 변환
            pos.z = pos.y * _Depth; //수심에 따라 z 위치 조절 
            float radius = 1.0 - pos.z; //반지름 조절

            //공의 표면을 구성하는 코드 (커스텀 가능)
            float dist = length(pos - float3(0.5,0.5,0));//중심으로부터 거리
            float alpha = smoothstep(radius - 0.05, radius + 0.05, dist); //희미한 효과를 위한

            o.Albedo = float3(1,0,0); //공 색상 >> 빨간색
            o.Alpha = alpha;
            
            }
            ENDCG
    }
    FallBack "Diffuse"
}
