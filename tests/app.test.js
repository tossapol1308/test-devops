describe('Basic sanity test', () => {
  it('should be true', () => {
    expect(true).toBe(true)
  })
})

// ถ้าคุณเปลี่ยน index.js ให้เป็น express server
// คุณสามารถเพิ่ม supertest มาทดสอบ /health endpoint ได้ เช่น:
//
// const request = require('supertest')
// const app = require('../index') // สมมติ export app
//
// describe('Health endpoint', () => {
//   it('GET /health should return 200', async () => {
//     const res = await request(app).get('/health')
//     expect(res.status).toBe(200)
//   })
// })
