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
            //���ɿ� ���� ���� ũ�� ����
            float3 pos = float3(IN.uv_MainTex, 0); //2D ��ǥ�� 3D�� ��ȯ
            pos.z = pos.y * _Depth; //���ɿ� ���� z ��ġ ���� 
            float radius = 1.0 - pos.z; //������ ����

            //���� ǥ���� �����ϴ� �ڵ� (Ŀ���� ����)
            float dist = length(pos - float3(0.5,0.5,0));//�߽����κ��� �Ÿ�
            float alpha = smoothstep(radius - 0.05, radius + 0.05, dist); //����� ȿ���� ����

            o.Albedo = float3(1,0,0); //�� ���� >> ������
            o.Alpha = alpha;
            
            }
            ENDCG
    }
    FallBack "Diffuse"
}
