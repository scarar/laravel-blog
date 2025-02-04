@extends('layouts.app')

@section('content')
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        @foreach($posts as $post)
            <div class="bg-white rounded-lg shadow p-6">
                <h2 class="text-xl font-bold mb-2">
                    <a href="{{ route('posts.show', $post) }}" class="text-blue-600 hover:text-blue-800">
                        {{ $post->title }}
                    </a>
                </h2>
                <p class="text-gray-600 mb-4">{{ Str::limit($post->content, 150) }}</p>
                <div class="text-sm text-gray-500">
                    Posted {{ $post->created_at->diffForHumans() }}
                </div>
            </div>
        @endforeach
    </div>

    @if($posts->isEmpty())
        <p class="text-center text-gray-500 mt-8">No posts yet. Why not create one?</p>
    @endif
@endsection