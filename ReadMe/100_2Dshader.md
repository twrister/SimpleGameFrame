## 2D shader

- 灰度 grayscale
- 上色 sepia
- 反色 nagate
- 像素 pixel
- 色相 hue

#### todo
- 边缘检测
- 颜色填充 color fill
- 颜色叠加 color add
- 颜色替换 color sub
- 模糊 blur
- 阴影 shadow
- 渐变 gradient
- 翻转 flip
- 扫光 shiny
- 消融 dissolve
- 过渡 transition
- 水波纹、旋涡
- 扭曲
- 2D雾效
- 2D描边
- 程序纹理
- 序列帧
- 顶点动画
- Billboard

UGUI中给Image赋予材质，需要shader中加入
```
Tags
{ 
	"Queue"="Transparent" 
	"IgnoreProjector"="True" 
	"RenderType"="Transparent" 
	"PreviewType"="Plane"
	"CanUseSpriteAtlas"="True"
}

Cull Off
Lighting Off
ZWrite Off
ZTest [unity_GUIZTestMode]
Fog { Mode Off }
Blend SrcAlpha OneMinusSrcAlpha
```

[变体相关](https://docs.unity3d.com/Manual/SL-MultipleProgramVariants.html)  

基础材质如下
```
Shader "ShaderDemo/remove"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags
        {
            "Queue" = "Transparent"
            "IgnoreProjector" = "True"
            "RenderType" = "Transparent"
            "PreviewType" = "Plane"
            "CanUseSpriteAtlas" = "True"
        }

        Cull Off
        Lighting Off
        ZWrite Off
        ZTest [unity_GUIZTestMode]
        Fog { Mode Off }
        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                return col;
            }
            ENDCG
        }
    }
}

```