#include "Basic.hlsli"

// 顶点着色器
VertexPosHWNormalTex VS(InstancePosNormalTex vIn)
{
    VertexPosHWNormalTex vOut;
    
    vector posW = mul(float4(vIn.PosL, 1.0f), vIn.World);

    vOut.PosW = posW.xyz;
    vOut.PosH = mul(posW, g_ViewProj);
    vOut.NormalW = mul(vIn.NormalL, (float3x3) vIn.WorldInvTranspose);
    vOut.Tex = vIn.Tex;
    return vOut;
}