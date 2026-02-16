-- SQL Queries to Check Database Content
-- Run these in DBeaver Query Editor

-- 1. Check total number of documents embedded
SELECT COUNT(*) as total_documents FROM document_embeddings;

-- 2. View sample documents with all details
SELECT 
    id,
    chapter_name,
    source,
    LEFT(text, 100) as text_preview,  -- First 100 characters of text
    embedding IS NOT NULL as has_embedding
FROM document_embeddings
ORDER BY id
LIMIT 10;

-- 3. Check documents by source
SELECT 
    source, 
    COUNT(*) as document_count
FROM document_embeddings
GROUP BY source
ORDER BY document_count DESC;

-- 4. Check documents by chapter
SELECT 
    chapter_name,
    source,
    COUNT(*) as count
FROM document_embeddings
GROUP BY chapter_name, source
ORDER BY count DESC
LIMIT 20;

-- 5. View full text of a specific document
SELECT 
    id,
    chapter_name,
    source,
    text,
    LENGTH(text) as text_length
FROM document_embeddings
WHERE id = 1;  -- Change ID to see different documents

-- 6. Check if embeddings are actually stored (not NULL)
SELECT 
    COUNT(*) as total,
    COUNT(embedding) as with_embeddings,
    COUNT(*) - COUNT(embedding) as missing_embeddings
FROM document_embeddings;

-- 7. View recent chat history
SELECT 
    id,
    user_id,
    LEFT(query, 50) as query_preview,
    LEFT(response, 50) as response_preview,
    similarity,
    source,
    chapter_name,
    timestamp
FROM chat_history
ORDER BY timestamp DESC
LIMIT 10;

-- 8. Check users table
SELECT 
    id,
    username,
    search_count,
    role,
    last_active
FROM users
ORDER BY id;
